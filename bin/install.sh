#/bin/bash

# This script installs files in dotfiles by creating symlinks in the user's
# home direcory. It will create backups first unless overridden.

PROJECT_PATH=~/.dotfiles
DOTFILE_PATH="$PROJECT_PATH"/home

# creates symlinks for
function symlink_dotfiles {
    for file in $1/{.[!.]*,*}; do
        # directories
        if [ -d "$file" ]; then
            dest_dir=$HOME${file#$DOTFILE_PATH}
            test -e "$dest_dir" || mkdir -p $dest_dir
            symlink_dotfiles $file
        # files
        elif [ -f "$file" ]; then
            dest=$HOME${file#$DOTFILE_PATH}
            echo "symlinking: $file => $dest"

            if [[ -e $dest && ( ! -h $dest ) ]]; then
                # File exists and is not a symlink, so let's ask what to do
                # chioces are backup and replace, or skip.  
                echo "$dest exists: Do you wish backup and replace?"
                select yn in "yes" "no"; do
                    case $yn in 
                        yes )
                            echo "replacing $dest"
                            mv $dest "$dest"~
                            ln -sf $file $dest
                            break;;
                        no )
                            echo "skipping $dest"
                            break;;
                    esac
                done
            else
                # The file was a symlink, or doesn't exist, so we can just
                # symlink it.
                ln -sf $file $dest
            fi
        fi
    done
}

symlink_dotfiles "$PROJECT_PATH"/home
