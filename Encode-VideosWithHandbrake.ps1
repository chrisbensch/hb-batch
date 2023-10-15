# 

$filelist = Get-ChildItem C:\Temp\MoviesTemp\ -Recurse -File | Where-Object {$_.Extension -eq '.mkv' -or $_.Extension -eq '.mp4'}
 
$num = $filelist | Measure-Object
$filecount = $num.count
 
$i = 0;
ForEach ($file in $filelist)
{
    $i++;
    $oldfile = $file.DirectoryName + "\" + $file.BaseName + $file.Extension
    $tempfile = $file.DirectoryName + "\" + "old_" + $file.BaseName + $file.Extension
    #$oldFileName = $originalFileName + "_old"
    #Rename-Item -Path $originalFileName -NewName $oldFileName
    Rename-Item -Path $oldfiel -NewName $tempfile

    
    $newfile = $file.DirectoryName + "\" + $file.BaseName + ".mp4"
      
    $progress = ($i / $filecount) * 100
    $progress = [Math]::Round($progress,2)
 
    Clear-Host
    Write-Host -------------------------------------------------------------------------------
    Write-Host Handbrake Batch Encoding
    Write-Host "Processing - $oldfile"
    Write-Host "File $i of $filecount - $progress%"
    Write-Host -------------------------------------------------------------------------------
     
    #Start-Process "C:\Program Files\HandBrake\HandBrakeCLI.exe" -ArgumentList "-i `"$oldfile`" -t 1 --angle 1 -c 1 -o `"$newfile`" -f mp4  -O  --decomb --modulus 16 -e x264 -q 32 --vfr -a 1 -E lame -6 dpl2 -R Auto -B 48 -D 0 --gain 0 --audio-fallback ffac3 --x264-preset=veryslow  --x264-profile=high  --x264-tune=`"animation`"  --h264-level=`"4.1`"  --verbose=0" -Wait -NoNewWindow
    Start-Process "C:\Tools\HandBrakeCLI\HandBrakeCLI.exe" -ArgumentList "-i `"$oldfile`" -o `"$newfile`" --preset-import-file `"C:\Tools\Tdarr\Bensch4k-HW-Handbrake.json`" -Z `"Bensch4kHW`" " -Wait -NoNewWindow
}
