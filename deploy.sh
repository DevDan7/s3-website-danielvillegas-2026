#!/usr/bin/env bash
# Deploy seguro del portafolio a S3.
# Solo sube una allowlist de archivos servibles: nunca tfstate, .terraform/, *.tf ni fuentes originales.
#
# Uso:
#   ./deploy.sh            -> producción (raíz del bucket)
#   ./deploy.sh preview    -> s3://<bucket>/preview/ para revisar cambios antes de publicarlos
#   DRY_RUN=1 ./deploy.sh  -> muestra qué haría sin subir nada
set -euo pipefail

TARGET="${1:-prod}"

case "$TARGET" in
  prod)    PREFIX="" ;;
  preview) PREFIX="preview/" ;;
  *) echo "Uso: $0 [prod|preview]" >&2; exit 1 ;;
esac

cd "$(dirname "$0")"

# Bucket desde Terraform (fuente única de verdad); fallback si no hay state local.
BUCKET="${BUCKET:-$(terraform output -raw bucket_name 2>/dev/null || echo proyecto-s3-website-danelvillegas-2026)}"
REGION="${AWS_REGION:-us-east-1}"
DEST="s3://${BUCKET}/${PREFIX}"
DRY=${DRY_RUN:+--dryrun}

# Allowlist de lo que la web sirve. Si agregás un archivo nuevo al sitio, sumalo acá.
INCLUDES=(
  --exclude "*"
  --include "index.html"
  --include "error.html"
  --include "img/*.webp"
  --include "img/comunidad/*.webp"
  --include "img/cert-*.png"
  --include "img/*.pdf"
)

echo "Deploy -> ${DEST}"

# HTML (index + 404) sin caché para que los cambios se vean al instante; assets con caché de 7 días.
# --delete solo actúa sobre objetos que matchean la allowlist (no toca el resto del bucket).
aws s3 sync . "$DEST" --region "$REGION" $DRY --delete "${INCLUDES[@]}" --exclude "index.html" --exclude "error.html" \
  --cache-control "public, max-age=604800"
aws s3 cp index.html "${DEST}index.html" --region "$REGION" $DRY \
  --content-type "text/html; charset=utf-8" --cache-control "no-cache"
aws s3 cp error.html "${DEST}error.html" --region "$REGION" $DRY \
  --content-type "text/html; charset=utf-8" --cache-control "no-cache"

echo "URL: http://${BUCKET}.s3-website-${REGION}.amazonaws.com/${PREFIX}"
