@echo off

echo "


Npm install:"
npm install
echo "


Copy %CD%env file:"
SET file=%CD%\%CD%env.docker
REM UNKNOWN: {"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[","type":"Word"},"suffix":[{"text":"-f","type":"Word"},{"text":"\"$file\"","expansion":[{"loc":{"start":1,"end":5},"parameter":"file","type":"ParameterExpansion"}],"type":"Word"},{"text":"]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"$file found.\"","expansion":[{"loc":{"start":1,"end":5},"parameter":"file","type":"ParameterExpansion"}],"type":"Word"}]},{"type":"Command","name":{"text":"cp","type":"Word"},"suffix":[{"text":"$file","expansion":[{"loc":{"start":0,"end":4},"parameter":"file","type":"ParameterExpansion"}],"type":"Word"},{"text":"./.env","type":"Word"}]},{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":".env created","type":"Word"}]}]},"else":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"$file not found.\"","expansion":[{"loc":{"start":1,"end":5},"parameter":"file","type":"ParameterExpansion"}],"type":"Word"}]},{"type":"Command","name":{"text":"exit","type":"Word"},"suffix":[{"text":"1","type":"Word"}]}]}}
echo "


Run migration:"
adonis migration:run --force
echo "


Start node server:"
adonis serve --dev --polling