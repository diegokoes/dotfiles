# Stow (steps to remember)
1. **Create your dotfiles repo & init git**
   ```
   → mkdir ~/dotfiles
   → cd ~/dotfiles
   → git init
   ```

2. **Copy your existing  config into the dotfiles repo with correct structure**
   ```
   → mkdir -p hypr/.config
   → cp -r ~/.config/hypr hypr/.config/
   ```

3. **Backup your original  config**
   ```
   → mv ~/.config/hypr ~/.config/hypr.bak
   ```

4. **Symlink with Stow**
   ```
   → cd ~/dotfiles
   → stow hypr
   ```

5. **Commit your  config to git**
   ```
   → git add .
   → git commit -m "Add hypr config"
   ```

6. **(Optional) Delete the backup after confirming everything works**
   ```
   → rm -rf ~/.config/hypr.bak
   ```

- - - 

¡Don't add .git or .ssh stuff! it doesn't encrypt /!TO DO LOOK UP HOW TO BACK UP THAT WITH ENCRYPTION !\
