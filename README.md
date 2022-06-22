# fictional_spork

In order to run the app
- add the following block to launch.json in vscode, replace PATH with the current api path
``` {
        "name": "fictional-spork-client",
        "request": "launch",
        "type": "dart",
        "args": [
            "--dart-define",
           "API_BASE_URL=$PATH/api",
        ]
    },
```
- follow firebase's initialization instructions to configure the app with proper settings (some files are gitignored because they have api keys) [link](https://firebase.google.com/docs/flutter/setup)
- run the app

