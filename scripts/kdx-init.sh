#!/bin/bash

# Function to print an error message and exit the script
function handle_error {
    echo "Error: $1"
    exit 1
}
# Export Path 
export GOPATH=/usr && \
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
  
# Create directory /kaspadgrid
echo "Creating directory /kaspadgrid..."
mkdir /kaspadgrid || handle_error "Failed to create directory /kaspadgrid"

# Change to directory /kaspadgrid
echo "Changing to directory /kaspadgrid..."
cd /kaspadgrid || handle_error "Failed to change to directory /kaspadgrid"

# Clone the kaspad repository
echo "Cloning the kaspad repository..."
git clone https://github.com/kaspanet/kaspad || handle_error "Failed to clone repository https://github.com/kaspanet/kaspad"

# Change to the kaspad directory
echo "Changing to directory kaspad..."
cd kaspad || handle_error "Failed to change to directory kaspad"

# Install go packages with progress reporting
echo "Installing go packages..."
go install . ./cmd/.. 2>&1 | tee install.log || handle_error "Failed to install go packages"

echo "Installation completed successfully."

#Start Kaspad 
cd $gopath/bin
./kaspad --utxoindex

