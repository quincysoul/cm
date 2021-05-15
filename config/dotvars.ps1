# Set to the location of your chia. Most likely, just change username.
$chia_location="C:\Users\shawn\AppData\Local\Chia-Blockchain"
# Set to currently installed chia version.
$chia_version="app-1.1.2"

#override
$chia_path = Resolve-Path "$Env:USERPROFILE\AppData\Local\chia-blockchain\*\resources\app.asar.unpacked\daemon\chia.exe"

# Set to nvme 1
$nvme_1_temp="X:\temp"
$nvme_2_temp="Y:\temp"
# Set min and max stagger (Recommended not 0. Phase 1 takes multi-threading so stagger is beneficial.)
$stagger_min_seconds=1000
$stagger_max_seconds=4200
<# Reference:
1. Divide $nvme_storage/332GB. This is the max simultaneous queues you can run on *that* NVME.
2. Divide ($total_ram - 4GB)/3400GB. This is the max simultaneous queues you can run on your computer (more if using less than 3400GB setting).
3. Divide $total_threads/2. If it is smaller than the ram calculation, this is the new max simultaneous queues.

-t `temp directory`. Set to nvme storage (burns TBW). Burns ~300GB per plot
-d `destination directory`. Set to hdd storage. (low usage, burns electricity for reads).
-n `number of plots`. (101.4GB * $num_queues)/$destination_free_space = max num plots to run in that queue.
#>