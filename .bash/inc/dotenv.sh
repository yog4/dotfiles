dotenv() {
    FILE="${1:-.env}"
    config=$(sed 's/^#.*//' $FILE | sed 's/\([^=]*\)=\(.*\)/export \1="\2"/')
    eval $config
}