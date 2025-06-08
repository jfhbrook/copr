# Apply the COPR registry configuration
apply-registry:
  coprctl apply -f registry.yml

# Create a new COPR package
new template:
  cookiecutter -o packages './templates/{{ template }}'

# Lint scripts
lint:
  shellcheck prelude.sh ./bin/*
