if [[ ! $1 =~ (0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))? ]]; then
    echo "No valid version supplied"
    exit 1
fi

VERSION_NUMBER=$1
echo "Updating podspec version number to $VERSION_NUMBER"


cd SkeletonView &>/dev/null
cd .. &>/dev/null

sed -i '' -E "s/(s.version[[:space:]]+=[[:space:]]+').*(')/\1$VERSION_NUMBER\2/" SkeletonView.podspec