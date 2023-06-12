package snippets

"osclient_import": #Snippet & {
  prefix: "osimport"
  description: "import strings for the openstack client"
  body: """
  "github.com/gophercloud/gophercloud/openstack"
  "github.com/gophercloud/utils/openstack/clientconfig"
  """
}

"openstack_client": #Snippet & {
	prefix: "osclient"
	description: "simplify creation of os client"
	body: """
		opts := clientconfig.ClientOpts{}
		clientOpts, err := clientconfig.AuthOptions(&opts)
		if err != nil {
			panic(err)
		}

		provider, err := openstack.AuthenticatedClient(*clientOpts)
		if err != nil {
			panic(err)
		}
		"""
}
