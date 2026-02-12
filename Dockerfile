FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    curl git tmux vim ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash claude

USER claude
ENV PATH="/home/claude/.local/bin:/home/claude/.cargo/bin:${PATH}"

RUN curl -fsSL https://claude.ai/install.sh | bash
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add aliases
RUN cat <<'EOF' >> /home/claude/.bashrc

# claude code alias
alias c='claude'
alias cc='claude --continue'
alias cr='claude --resume'
alias ch='claude --chrome'

# dangerously mode aliases
alias cdg='claude --dangerously-skip-permissions'
alias cdgc='claude --dangerously-skip-permissions --continue'
alias cdgr='claude --dangerously-skip-permissions --resume'

# Git aliases
alias gb='git branch'
alias gco='git checkout'
alias gst='git status'
alias gd='git diff'

# quick exit
alias q='exit'

echo ""
echo "=============================="
echo " Claude Sandbox Ready"
echo "=============================="
echo ""
echo "Claude aliases:"
echo "  c     -> claude"
echo "  cc    -> claude --continue"
echo "  cr    -> claude --resume"
echo "  ch    -> claude --chrome"
echo "  cdg   -> claude --dangerously-skip-permissions"
echo "  cdgc  -> dangerously + continue"
echo "  cdgr  -> dangerously + resume"
echo ""
echo "Git aliases:"
echo "  gb    -> git branch"
echo "  gco   -> git checkout"
echo "  gst   -> git status"
echo "  gd    -> git diff"
echo ""
echo "Type 'q' to exit."
echo ""

EOF

WORKDIR /workspace
CMD ["/bin/bash"]