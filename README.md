ca Cookbook
===========

This cookbook provides custom resource and helpers to make installation of your own CA easy.
If your node runlist contains a recipe called desktop it will store copy of CA cert in user's
home directory (can be used with desktop and user cookbooks from same cookbook group)

Requirements
------------

optionally desktop and user cookbook

Attributes
----------

no so far

Usage
-----

To include your CA certificate, you have to store your certificate in your cookbook under files
then somewhere in you recipe add call like this

    ca_cert 'name_of_my_cert.pem'

this will store this certificate in local pki directory based on node platform and will call
update-ca-certificates / update-ca-trust extract again based on platform.

You can also use two helpers if you need to customize the behaviour

  ca_install_path('name') # => '/usr/local/share/ca-certificates/name' (based on platform)
  ca_update_command # => 'update-ca-trust extract' (based on platform)
