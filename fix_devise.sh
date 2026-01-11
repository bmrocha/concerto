#!/bin/bash
set -e
FILES="/usr/local/rvm/gems/*/gems/devise-3.5.10/app/controllers/devise/sessions_controller.rb /usr/local/rvm/gems/default/gems/devise-3.5.10/app/controllers/devise/sessions_controller.rb"
for f in $FILES; do
  if [ -f "$f" ]; then
    cp "$f" "$f.bak"
    awk '/devise.skip_timeout/ { print "prepend_before_filter only: [:create, :destroy] do"; print "    request.env[\"devise.skip_timeout\"] = true"; print "  end"; next } { print }' "$f.bak" > "$f"
    chown app:app "$f" "$f.bak" || true
    echo "Fixed $f"
  fi
done
