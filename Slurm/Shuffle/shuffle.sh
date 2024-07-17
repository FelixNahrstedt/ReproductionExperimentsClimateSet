pwd

while true; do
    read -p "Do you wish to remove old files? " yn
    case $yn in
        [Yy]* ) rm -f ../Slurm/{*,.*}; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# sbatch Slurm/Shuffle/climax
# sbatch Slurm/Shuffle/climax_frozen
sbatch Slurm/Shuffle/convlstm
sbatch Slurm/Shuffle/unet



echo "Success - Go do something else now :)!"