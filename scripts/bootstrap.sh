#!/usr/bin/env bash

# set of functions to remove and replace dotfiles

# remove dotfiles
function remove_dotfiles(){
		rm -rf ~/.aliases
    rm -rf ~/.bash_profile
    rm -rf ~/.bash_prompt
    rm -rf ~/.bashrc
    rm -rf ~/.functions
    rm -rf ~/.profile
}


function move_dotfiles(){
		cp .aliases ~/.aliases
    cp .bash_profile ~/.bash_profile
    cp .bash_prompt ~/.bash_prompt
    cp .bashrc ~/.bashrc
    cp .functions ~/.functions
    cp .profile ~/.profile
		cp -r .config ~/.config
}

function setup_starship(){
    echo "Setting up Starship prompt..."
    
    # Check if starship is already installed
    if command -v starship &> /dev/null; then
        echo "Starship is already installed"
    else
        echo "Installing Starship..."
        # Create local bin directory if it doesn't exist
        mkdir -p ~/.local/bin
        
        # Install starship
        curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
        
        # Add local bin to PATH if not already there
        if ! grep -q '\.local/bin' ~/.bashrc; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        fi
    fi
    
    # Copy starship configuration
    echo "Copying Starship configuration..."
    mkdir -p ~/.config
    cp starship/starship.toml ~/.config/starship.toml
    
    # Add starship init to bashrc if not already there
    if ! grep -q 'starship init bash' ~/.bashrc; then
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
        echo "Added Starship init to ~/.bashrc"
    fi
    
    echo "Starship setup complete! Please restart your terminal or run 'source ~/.bashrc'"
}

