# Sketch
FROM bluebrown/vue as vue
# Build statics
FROM django
COPY --from=vue /builder/public /application/static

