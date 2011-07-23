#
# Uname module
# Interface to `uname` [or `ver` on Windows].
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
module Uname 

	# Equivalent to Uname.short, for compatibility with `sys/uname`,
	# which this module was written to replace for compatibility
	# with IronRuby - no C code here ;).
	def self.sysname()
		self.short
	end

	def self.short()
		self.invokeUname("-s")
	end
	private
	def self.invokeUname(params)
		output = nil
		begin
			output = IO.popen("uname #{params}")
			output = output.readlines
			output = output[0].chomp
		rescue
			output = IO.popen("ver")
			output = output.readlines
			output = output[1].chomp
		end
		return output
	end
end
