Machine setup/sync scripts
==========================

Purpose
-------
This repository holds the public part of the setup and config files I use on
my desktop machines. It requires nothing but a base (Arch Linux) installation,
network access, and a copy of `setup.sh` to be copied on the machine, and a
few moments later, the entire machine is set up and ready to use with my
favorite desktop environment, packages, application configuration, services,
user accounts, SSH/PGP keys, network profiles, etc.

Usage
-----
Unfortunately, this repository cannot be used as-is, because there is a
private part to it. This is necessary because it includes user passwords, SSH
private keys, etc. I do not want to expose these files to the whole Internet,
so these are not in this repo. However, I understand that some people may want
to use these scripts for their own purposes. To this end, I tried as hard as
possible to make as many files public as possible, and I provide a directory
layout of the private repository in the `private-layout.txt` file. It should
give you an idea of what files it expects.

However, I still recommend that this repository should only be used as a
source of inspiration, rather than as a source of actual code. It has some
kludge-y and/or assumption-y parts about how things should behave.

Still, as far as usage goes, it's simple: Run `setup.sh` as root. You don't
even need a full copy of the Git repo, you just need this one `setup.sh` file
copied on the new machine, a working network connection (even if temporary
through `dhcpcd`), and a base Arch install (`base` and `base-devel`).

Given these things, you can just run `setup.sh` as root to start the process.

It will interactively ask for three things:

* To "open the flood gates" (which basically means making the private repo
  public for a few seconds)
* The decryption key to decrypt the files in the private repo
* The name of the machine manifest to use (i.e. which profile to follow).
  Manifests are defined in the `manifests` folder.

Public/private repositories
---------------------------
This section documents the public/private splitting in more details, because
there is no such thing as security though obscurity.

There are two repositories:

* `git://perot.me/pupfiles` is the main, public repository: it contains the
  cleartext files that you see next to this `README` file. It contains the
  vast majority of the files required for the system to work.
* `git://perot.me/pupfiles-private` is the private repository. It contains all
  files that I'd rather not make public, such as SSH keys, GPG keys,
  distribution-restricted files, etc. All files in there are encrypted.

This repository is usually only accessible over SSH
(through `git@perot.me:pupfiles-private`). However, when you run `setup.sh`,
it assumes that it is being run on a new machine (that's the purpose of this
whole system, anyway) which necessarily doesn't have any SSH keys on it. Thus,
it asks for the private repository to be opened for a few moments so that it
can clone it locally. Once it has done so, it asks for the private repository
to be closed, and it asks for the decryption key used to encrypt the files in
the private repository. One of these files is an SSH key named `ssh.key` which
has access to the private repository over SSH. Thus, if the correct decryption
key is provided, the machine now has a copy of `ssh.key` and no longer needs
the private repository to be opened to the public.

I believe this system is secure enough. Of course, it is vulnerable to someone
constantly trying to clone the private repository, hoping to clone it in the
small timeframe during which it is open, but hopefully [xinetd] will throttle
them to make this attack unsuccessful. In the event that the attack is
successful, it would still require massive amounts of computational power to
decrypt all the files.

The encryption used on the files is done using [`scrypt`][scrypt] (which is a
very slow key derivation function used to get the actual encryption key of the
AES256-CTR stream), such that it would not be a catastrophe if someone were to
get a copy of a file from the private repository. The scripts taking care of
the encryption and decryption are `util/encrypt-scrypt.py` and
`util/decrypt-scrypt.py` respectively.

Licensing
---------
This repository is licensed under a [CC BY-SA 3.0 license]. Check the
`LICENSE` file for more information.

[CC BY-SA 3.0 license]: https://creativecommons.org/licenses/by-sa/3.0/
[scrypt]: https://www.tarsnap.com/scrypt.html
[xinetd]: http://www.xinetd.org/
