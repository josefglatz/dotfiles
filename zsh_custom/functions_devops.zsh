# Generate SSH Key Pair without touching disk
    # Usage: `ssh-keypairgeneration-secure "Project Name"`
    #
ssh-keypairgeneration-secure () {
    echo "${RESET}Creating RSA Key pair with 4096 bit with comment \"GitLab Deploy Key $@\"${RESET}"...
    rm -rf key{,.pub} &> /dev/null && mkfifo key key.pub && cat key key.pub | secure-pbcopy & echo "y" | ssh-keygen -t rsa -b 4096 -C "CI Deploy Key $@" -f key &> /dev/null ; rm -rf key{,.pub} &> /dev/null;

    echo "\n\n${GREEN}✅ Private and public key generated.\n🔑 Key pair securely copied to your clipboard!${RESET}\n\n";

    # if read -q "?Do you want to print the ${BLUE}public${RESET} key to your screen (stdout) [y/n] ?"; then
    #     publicKey=`pbpaste | sed -n '/END\ OPENSSH/{n;p;}'`
    #     echo $publicKey
    #     echo "\n"
    # fi

    # if read -q "?Do you want to print the ${YELLOW}private${RESET} key to your screen (stdout) [y/n] ?"; then
    #     privateKey=`pbpaste | awk '1;/END/{exit}'`
    #     echo "\n${MAGENTA}$privateKey${RESET}\n"
    # fi

    echo "🏁 ${YELLOW}And hey:${RESET} The key pair is located in your clipboard 😉 Please paste it where it's secure!\n"
    return 0
}

