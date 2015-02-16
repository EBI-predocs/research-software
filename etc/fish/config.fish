#
# Init file for fish
#

#
# Some things should only be done for login terminals
#

if status --is-login

    set -x LSF_BINDIR /ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64
    set -x LSF_ENVDIR /ebi/lsf/ebi/conf
    set -x LSF_LIBDIR /ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/lib
    set -x LSF_SERVERDIR /ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/etc

	#
	# Set some value for LANG if nothing was set before, and this is a
	# login shell.
	#

	if not set -q LANG >/dev/null
		set -gx LANG en_US.UTF-8
	end

	# Check for i18n information in
	# /etc/sysconfig/i18n

	if test -f /etc/sysconfig/i18n
		eval (cat /etc/sysconfig/i18n |sed -ne 's/^\([a-zA-Z]*\)=\(.*\)$/set -gx \1 \2;/p')
	end

	#
	# Put linux consoles in unicode mode.
	#

	if test "$TERM" = linux
		if expr "$LANG" : ".*\.[Uu][Tt][Ff].*" >/dev/null
			if which unicode_start >/dev/null
				unicode_start
			end
		end
	end
end

