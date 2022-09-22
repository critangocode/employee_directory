module ApplicationHelper
	def gravatar_for(employee, options = {size: 80})
		email_address = employee.email.downcase
		hash = Digest::MD5.hexdigest(email_address)
		size = options[:size]
		gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
		image_tag(gravatar_url, alt: employee.first_name)
	end
end
