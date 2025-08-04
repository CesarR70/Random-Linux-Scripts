if [ -f /var/run/reboot-required ]; then
    echo "Reboot is required."
else
    echo "No reboot is required."
fi

