function copy
  cat $argv | wl-copy
  echo "Copied $argv to clipboard"
end
