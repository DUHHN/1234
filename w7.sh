echo "Download windows files"
wget -O w7x64.img https://bit.ly/akuhnetw7X64
echo "Download ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Downloading Qemu
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo "Wait"
echo "Starting Windows"
sudo qemu-system-x86_64 -vnc :0 -hda w7x64.img  -smp cores=4  -m 8192M -machine usb=on -device usb-tablet -vga qxl -nographic > /dev/null 2>&1
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "===================================="
echo "===================================="
echo "===================================="
sleep 432000
