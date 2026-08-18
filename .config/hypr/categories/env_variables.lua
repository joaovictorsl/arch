-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.socket")
