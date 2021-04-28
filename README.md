## Instructions
1. Go to windows store. Install windows terminal (preview)
2. Start > `wt` to open windows terminal.
3. Save this repo in example: `C:\Users\YOUR_USERNAME\Documents\chia_miners`, then you will use that location for next step
4. Arrow dropdown `v` and click settings. Click open json file. Add these to `profiles`
```json
            {
                "commandline": "powershell.exe -NoExit -Command & C:\\Users\\YOUR_USERNAME\\Documents\\chia_miners\\start-chia-now-nvme1.ps1",
                "name": "chia1"
            },
            {
                "commandline": "powershell.exe -NoExit -Command & C:\\Users\\YOUR_USERNAME\\Documents\\chia_miners\\start-chia-now-nvme2.ps1",
                "name": "chia2"
            },
            {
                "commandline": "powershell.exe -NoExit -Command & C:\\Users\\YOUR_USERNAME\\Documents\\chia_miners\\start-chia-now-nvme1-ins.ps1",
                "name": "chia1-instant"
            },
            {
                "commandline": "powershell.exe -NoExit -Command & C:\\Users\\YOUR_USERNAME\\Documents\\chia_miners\\start-chia-now-nvme2-ins.ps1",
                "name": "chia2-instant"
            }
```
5. Open `./config/dotvars.ps1` and make sure to point to your chia location ( `C:\Users\YOUR_USERNAME\AppData\Local\Chia-Blockchain` ), and edit what chia version you have installed now
6. Open each `start-chia-now.....` and edit the -t flag for nvme temp
7. Open each `start-chia-now.....` and edit the -d flag for hdd permanent storage
8. Right click `./start-all.ps1` and `run with powershell`.

This will work with 8 parallel if you have 32GB RAM and 2 NVME with 1.3TB storage free each.