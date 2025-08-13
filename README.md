# Vim Configuration for Back-end Development

A comprehensive Vim setup optimized for back-end development, featuring modern plugins, efficient workflows, and a well-organized development environment.

## 🚀 Features

### Core Development Tools
- **Code Completion**: YouCompleteMe for intelligent autocompletion
- **Syntax Checking**: Syntastic and ALE for real-time error detection
- **File Navigation**: NERDTree with Git integration
- **Fuzzy Finding**: FZF for lightning-fast file and content search
- **Git Integration**: GitGutter for real-time diff visualization

### Language Support
- **PHP**: Full PHP development with PHPactor
- **Go**: Complete Go development environment with vim-go
- **Rust**: Rust language support with rust.vim
- **TypeScript**: TypeScript/JavaScript support with yats.vim
- **General**: EditorConfig for consistent coding standards

### Development Experience
- **Status Bar**: Airline with themes for enhanced status information
- **Debugging**: Vdebug for remote debugging capabilities
- **Tag Navigation**: Tagbar for code structure overview
- **Auto-tagging**: Automatic tag generation for various languages
- **GitHub Copilot**: AI-powered code suggestions

### Terminal Integration
- **Tmux Configuration**: Seamless tmux integration with vim-like navigation
- **Custom Scripts**: Utility scripts for enhanced workflow
- **Bash Integration**: Optimized shell configuration

## 📦 Installation

### Prerequisites
- Vim 8.0+ or Neovim
- [vim-plug](https://github.com/junegunn/vim-plug) plugin manager
- Git

### Quick Setup
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/vimrc.git ~/.vimrc-repo
   ```

2. **Install the configuration**:
   ```bash
   # Backup existing config (optional)
   mv ~/.vimrc ~/.vimrc.backup
   
   # Install new configuration
   ln -s ~/.vimrc-repo/.vimrc ~/.vimrc
   ln -s ~/.vimrc-repo/.tmux.conf ~/.tmux.conf
   ln -s ~/.vimrc-repo/.bashrc ~/.bashrc
   ```

3. **Install plugins**:
   ```vim
   :PlugInstall
   ```

4. **Install custom scripts**:
   ```bash
   cp ~/.vimrc-repo/bin/* ~/bin/
   chmod +x ~/bin/*
   ```

## 🛠️ Configuration Files

| File | Purpose |
|------|---------|
| `.vimrc` | Main Vim configuration with plugins and settings |
| `.tmux.conf` | Tmux configuration with vim-like navigation |
| `.bashrc` | Bash configuration with development aliases |
| `.editorconfig` | Consistent coding standards across editors |
| `bin/` | Custom utility scripts |

## 🎯 Key Mappings

### Navigation
- `<Ctrl-a>`: Tmux prefix (instead of `<Ctrl-b>`)
- `<Alt+hjkl>`: Navigate between tmux panes
- `<Ctrl-p>`: FZF file finder
- `<Ctrl-g>`: FZF grep search

### Development
- `<F8>`: Toggle tagbar
- `<Ctrl-n>`: Toggle NERDTree
- `<Leader>gd`: Go to definition (YouCompleteMe)
- `<Leader>gr`: Go to references (YouCompleteMe)

## 🔧 Customization

This configuration is designed to be a solid foundation. You can easily customize it by:

1. **Adding plugins**: Edit the `call plug#begin()` section in `.vimrc`
2. **Modifying keybindings**: Update the mapping sections
3. **Adjusting settings**: Modify the `set` commands to match your preferences

## 📝 Project Structure

```
vimrc/
├── .vimrc              # Main Vim configuration
├── .tmux.conf          # Tmux configuration
├── .bashrc             # Bash configuration
├── .editorconfig       # Editor standards
├── bin/                # Custom utility scripts
│   ├── brave          # Brave browser launcher
│   ├── kcalc          # Calculator shortcut
│   ├── mate-screenshot # Screenshot tool
│   └── tmux-vim       # Vim + tmux wrapper
└── README.md           # This file
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- All the amazing Vim plugin authors
- The Vim community for inspiration and support

---

**Note**: This configuration is optimized for back-end development workflows. While it works well for other use cases, it's specifically tailored for server-side development, database work, and API development.
