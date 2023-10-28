source ./my.env

gcloud run deploy cgm-server \
    --project=$PROJECT \
    --region=$REGION \
    --allow-unauthenticated \
    --execution-environment=gen2 \
    --source=. \
    --set-env-vars ENABLE="$ENABLE" \
    --set-env-vars MONGODB_URI="$MONGODB_URI" \
    --set-env-vars API_SECRET="$API_SECRET" \
    --set-env-vars MONGODB_COLLECTION="$MONGODB_COLLECTION" \
    --set-env-vars DISPLAY_UNITS="$DISPLAY_UNITS" \
    --set-env-vars CONNECT_SOURCE="$CONNECT_SOURCE" \
    --set-env-vars CONNECT_SHARE_ACCOUNT_NAME="$CONNECT_SHARE_ACCOUNT_NAME" \
    --set-env-vars CONNECT_SHARE_PASSWORD="$CONNECT_SHARE_PASSWORD" \
    --set-env-vars CONNECT_SHARE_REGION="$CONNECT_SHARE_REGION" \
    --set-env-vars INSECURE_USE_HTTP="$INSECURE_USE_HTTP" \
    --set-env-vars AUTH_DEFAULT_ROLES="$AUTH_DEFAULT_ROLES" \
    --set-env-vars SHOW_FORCAST="$SHOW_FORCAST" \
    --set-env-vars DEVICESTATUS_ADVANCED="$DEVICESTATUS_ADVANCED" \
    --set-env-vars PUMP_FIELDS="$PUMP_FIELDS" \
    --set-env-vars PUMP_RETRO_FIELDS="$PUMP_RETRO_FIELDS" \
    --set-env-vars OPENAPS_FIELDS="$OPENAPS_FIELDS" \
    --set-env-vars OPENAPS_RETRO_FIELDS="$OPENAPS_RETRO_FIELDS" \
    --set-env-vars DEBUG_MINIFY="$DEBUG_MINIFY" \
    --set-env-vars NODE_ENV=production \
    --set-env-vars DE_NORMALIZE_DATES="$DE_NORMALIZE_DATES" 
    # --update-secrets=MONGODB_URI=MONGODB_URI:latest \
    # --update-secrets=API_SECRET=API_SECRET:latest \

gcloud run services update-traffic cgm-server \
    --project=$PROJECT \
    --region=$REGION \
    --to-latest 