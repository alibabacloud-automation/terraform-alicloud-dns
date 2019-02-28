module "test" {
	source							= "../"
	domain_name						= "aliyun.com"
	record_list						= [
		{
			name 					= "www"
			type 					= "A"
			ttl						= 600
			value 					= "223.5.5.5"
			priority				= 1
		},
		{
			name 					= "www"
			type 					= "MX"
			ttl						= 600
			value 					= "mx.aliyun.com"
			priority				= 1
		},
		{
			name 					= "cname"
			type 					= "CNAME"
			ttl						= 600
			value 					= "mx.aliyun.com"
			priority				= 1
		}
	]
}