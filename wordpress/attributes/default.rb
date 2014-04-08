versions = 'wordpress-3.8.1-ja'
default['wordpress']['file_name'] = "#{versions}.tar.gz"
default['wordpress']['auth_key'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['secure_auth_key'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['logged_in_key'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['nonce_key'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['auth_salt'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['secure_auth_salt'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['logged_in_salt'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['nonce_salt'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join

default['wordpress']['setting'] = [
	{
		:db_name => 'db1',
		:db_user => 'wpuser1',
		:db_password => (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join,
		:domain  => '1.hoge.com'
	},
	{
		:db_name => 'db2',
		:db_user => 'wpuser2',
		:db_password => (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join,
		:domain  => '2.hoge.com',
	}
]
