#!/bin/bash



copy_files() {
cat <<EOF
build_oneplus3.sh
make_clean.sh
switch_microG.sh
EOF
}


copy_files | while read FILE; do
    cp "$FILE" ../../
done
