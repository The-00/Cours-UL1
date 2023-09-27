#!/usr/bin/with-contenv ash

rules_file="/rules"

# Vérifiez si le fichier existe
if [ ! -f "$rules_file" ]; then
  echo "Le fichier '$rules_file' n'existe pas."
  exit 1
fi

if [ "$RULE_MODE" != "BULK" ]
then
	# Lire le fichier ligne par ligne et exécuter chaque ligne
	while IFS= read -r line; do

	  # Ignorer les lignes commentées (commençant par #)
	  if [ -n "$line" ] && [ "${line#"#"}" != "$line" ]; then
	    continue
	  fi
	  # Ignorer les lignes vides
	  if [ "x$line" == "x" ]; then
	    continue
	  fi

	  # Exécutez la ligne
	  echo "#> $line"
	  eval "$line"
	done < "$rules_file"
else
	# Executer tout le fichier d'un seul coup
	echo "source"
	echo "  +---------------"
	cat $rules_file | sed -E 's/^(.*)$/  |  \1/g'
	echo "  +---------------"
	source $rules_file
fi
