# Vim Configuration for Back-end Development

A comprehensive Vim setup optimized for back-end development, featuring modern plugins, efficient workflows, and a well-organized development environment with special focus on PHP development.

## 🚀 Features

### Core Development Tools
- **Code Completion**: YouCompleteMe for intelligent autocompletion
- **Syntax Checking**: Syntastic and ALE for real-time error detection
- **File Navigation**: NERDTree with Git integration
- **Fuzzy Finding**: FZF for lightning-fast file and content search
- **Git Integration**: GitGutter for real-time diff visualization

### PHP Development Environment
- **PHPactor**: Advanced PHP language server with intelligent code completion
- **PHP Code Sniffer**: PSR-12 and custom coding standards enforcement
- **PHPStan**: Static analysis for error detection and code quality
- **PHP CS Fixer**: Automatic code formatting and style fixing
- **Custom Configuration**: Pre-configured PHPactor settings for optimal workflow

### Language Support
- **PHP**: Full PHP development with PHPactor, PHPStan, and code quality tools
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
- Composer (for PHP tools)
- PHP 7.4+ (for PHP development)

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
   
   # Source the bashrc instead of replacing it
   echo "source ~/.vimrc-repo/.bashrc" >> ~/.bashrc
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

### PHP Development Setup

1. **Install PHP tools via Composer**:
   ```bash
   # Create composer_stuff directory
   mkdir -p ~/bin/composer_stuff
   cd ~/bin/composer_stuff
   
   # Install PHP development tools
   composer require --dev \
     squizlabs/php_codesniffer \
     phpstan/phpstan \
     friendsofphp/php-cs-fixer
   ```

2. **Create symlinks for easy access**:
   ```bash
   # Create symlinks to ~/bin for all PHP tools
   for binary in $(find ~/bin/composer_stuff/vendor/bin -type f -printf "%f\n"); do
     ln -s ~/bin/composer_stuff/vendor/bin/${binary} ~/bin/${binary}
   done
   ```

3. **Install PHPactor configuration**:
   ```bash
   # Create PHPactor config directory
   mkdir -p ~/.config/phpactor
   
   # Copy configuration (update paths in phpactor.json for your system)
   cp ~/.vimrc-repo/.config/phpactor/phpactor.json ~/.config/phpactor/
   ```

4. **Set up PHPStan configuration**:
   ```bash
   # Choose one of the PHPStan configuration options below
   ```
   
   **📋 PHPStan Configuration Options:**
   
   **Option A: Use base configuration with inheritance (recommended)**
   ```bash
   # Copy base config to your project
   cp ~/.vimrc-repo/config_templates/phpstan-base.neon ~/your-project/
   
   # Create your project config that inherits from base
   cat > ~/your-project/phpstan.neon << 'EOF'
   includes:
       - phpstan-base.neon
   
   parameters:
       level: 6
       paths:
           - src
           - tests
   EOF
   ```
   
   **Option B: Use framework-specific configuration**
   ```bash
   # For Laravel projects
   cp ~/.vimrc-repo/config_templates/phpstan-laravel.neon ~/your-project/phpstan.neon
   ```
   
   **Option C: Create a minimal configuration from scratch**
   ```bash
   # Create a simple phpstan.neon file
   cat > ~/your-project/phpstan.neon << 'EOF'
   parameters:
       level: 6
       paths:
           - src
           - tests
       excludePaths:
           - vendor/*
   EOF
   ```

## 🛠️ Configuration Files

| File | Purpose |
|------|---------|
| `.vimrc` | Main Vim configuration with plugins and settings |
| `.tmux.conf` | Tmux configuration with vim-like navigation |
| `.bashrc` | Bash configuration with development aliases |
| `.editorconfig` | Consistent coding standards across editors |
| `.config/phpactor/phpactor.json` | PHPactor language server configuration |
| `config_templates/` | Template configurations for various tools |

| `config_templates/phpstan-base.neon` | Base PHPStan configuration for inheritance |
| `config_templates/phpstan-laravel.neon` | Laravel-specific PHPStan configuration |
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

### PHP Development (PHPactor)
- `<Leader>u`: Transform class
- `<Leader>m`: Generate method
- `<Leader>n`: Navigate to class
- `<Leader>i`: Import class
- `<Leader>c`: Complete constructor

## 🔧 Customization

This configuration is designed to be a solid foundation. You can easily customize it by:

1. **Adding plugins**: Edit the `call plug#begin()` section in `.vimrc`
2. **Modifying keybindings**: Update the mapping sections
3. **Adjusting settings**: Modify the `set` commands to match your preferences
4. **PHPactor configuration**: Edit `~/.config/phpactor/phpactor.json` for PHP-specific settings
5. **PHPStan configuration**: Choose from multiple configuration options (see PHPStan Configuration Options above)

## 📝 Project Structure

```
vimrc/
├── .vimrc                    # Main Vim configuration
├── .tmux.conf               # Tmux configuration
├── .bashrc                  # Bash configuration
├── .editorconfig            # Editor standards
├── .config/
│   └── phpactor/
│       └── phpactor.json    # PHPactor language server config
├── config_templates/
│   ├── phpstan-base.neon    # Base configuration for inheritance
│   └── phpstan-laravel.neon # Laravel-specific configuration
├── bin/                     # Custom utility scripts
│   ├── brave               # Brave browser launcher
│   ├── kcalc               # Calculator shortcut
│   ├── mate-screenshot     # Screenshot tool
│   └── tmux-vim            # Vim + tmux wrapper
└── README.md               # This file
```

## 🐘 PHP Development Workflow

This setup provides a complete PHP development environment:

### Code Quality Tools
- **PHPStan**: Static analysis with configurable levels (1-9)
- **PHP Code Sniffer**: PSR-12 and custom coding standards
- **PHP CS Fixer**: Automatic code formatting and style fixing

### Language Server Features
- **Intelligent Completion**: Context-aware code suggestions
- **Go to Definition**: Navigate to class/method definitions
- **Refactoring**: Transform classes, generate methods, import classes
- **Error Detection**: Real-time syntax and logic error highlighting

### Configuration
- **PHPactor**: Configured for optimal PHP development workflow
- **PHPStan**: Multiple configuration options with inheritance support
- **Tools Integration**: All PHP tools accessible via `~/bin/` symlinks

### PHPStan Configuration Inheritance
This setup provides a flexible PHPStan configuration system:

**🔄 How Inheritance Works:**
- **Base Configuration** (`phpstan-base.neon`): Common settings for all PHP projects
- **Framework Configs** (`phpstan-laravel.neon`): Framework-specific settings that inherit from base
- **Project Configs**: Your actual `phpstan.neon` can inherit from either base or framework configs

**📋 Configuration Behavior:**
- **Simple values** (level, memoryLimit): Later values override earlier ones
- **Arrays** (ignoreErrors, excludePaths): Values are merged, not replaced
- **Nested objects**: Deep merge combines all properties

**🎯 Usage Examples:**
```yaml
# Simple project using base config
includes:
    - phpstan-base.neon
parameters:
    level: 6
    paths: [src, tests]

# Laravel project using framework config
includes:
    - phpstan-laravel.neon
parameters:
    level: 7  # Override Laravel's default level
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- [PHPactor](https://phpactor.readthedocs.io/) for advanced PHP language server
- All the amazing Vim plugin authors
- The Vim community for inspiration and support

---

**Note**: This configuration is optimized for back-end development workflows with special emphasis on PHP development. While it works well for other use cases, it's specifically tailored for server-side development, database work, and API development.
