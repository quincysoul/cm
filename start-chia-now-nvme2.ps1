# Load config
. ./config/dotvars.ps1
<# Reference:
1. Divide $nvme_storage/332GB. This is the max simultaneous queues you can run on *that* NVME.
2. Divide ($total_ram - 4GB)/3400GB. This is the max simultaneous queues you can run on your computer (more if using less than 3400GB setting).
3. Divide $total_threads/2. If it is smaller than the ram calculation, this is the new max simultaneous queues.

-t `temp directory`. Set to nvme storage (burns TBW). Burns ~300GB per plot
-d `destination directory`. Set to hdd storage. (low usage, burns electricity for reads).
-n `number of plots`. (101.4GB * $num_queues)/$destination_free_space = max num plots to run in that queue.
#>
cd "$($chia_location)\$($chia_version)\resources\app.asar.unpacked\daemon\"
$random_stagger = Get-Random -Minimum $stagger_min_seconds -Maximum $stagger_max_seconds
Write-Host "Waiting $($random_stagger) seconds to start execution"
Start-Sleep -Seconds $random_stagger
start-process ./chia.exe -NoNewWindow -argumentlist "plots create -k 32 -b 3000 -u 128 -r 2 -t Y:\temp -d D:\chia_plots -n 30"