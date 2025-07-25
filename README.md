# Stow (steps)

- **Copy config into the dotfiles repo*
   ```
   → mkdir -p hypr/.config
   → cp -r ~/.config/hypr hypr/.config/
   ```
- **Backup original  config**
   ```
   → mv ~/.config/hypr ~/.config/hypr.bak
   ```

- **Symlink with Stow**
   ```
   → cd ~/dotfiles
   → stow hypr
   ```
- - - 
- ¡Don't add .git or .ssh stuff! it doesn't encrypt /!TO DO LOOK UP HOW TO BACK UP THAT WITH ENCRYPTION !\
- Stow takes always the ~/ reference, to change it -> -t 'path'
