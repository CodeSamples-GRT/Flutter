# run function in all dirs
allDirectories() {
  dirs=($(find . -maxdepth 3 -type dbu))
  for dir in "${dirs[@]}"; do
    $1 "$dir"
  done
}

runBuild() {
  cd "$1" || exit
  if [ -f "pubspec.yaml" ]; then
    dart run build_runner build --delete-conflicting-outputs
  fi
  cd - >/dev/null || exit
}

if ! [ -d .git ]; then printf "\nError: not in root of repo"; fi

printf "\nRunning dart run build_runner in all packages\n"
allDirectories "runBuild"
printf "\nRunning dart run build_runner in all packages done\n"
tput bel
