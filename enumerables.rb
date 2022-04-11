require 'byebug'

class Array

    def my_each(&prc)
        2.times do
            i = 0
            while i < self.length
                prc.call(self[i])
                i += 1
            end
        end
    end

    def my_select(&prc)
        newar = []
        i = 0
        while i < self.length
            if prc.call(self[i])
                newar << self[i]
            end
            i += 1
        end
        newar
    end

    def my_reject(&prc)
        newar = []
        i = 0
        while i < self.length
            if !prc.call(self[i])
                newar << self[i]
            end
            i += 1
        end
        newar
    end

    def my_all?(&prc)
        i = 0
        while i < self.length
            return false if !prc.call(self[i])
            i += 1
        end
        true
    end

    def my_any?(&prc)
        
        i = 0
        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false
    end


    def my_flatten
        new_arr=[]
        return[self] if !self.kind_of?(Array)
        return self if self.none? {|ele| ele.kind_of?(Array)}
        new_arr += self.flatten
    end

    def my_zip(*args)
        newar = Array.new(self.length) {Array.new}
        joined = [self] + args
        (0...self.length).each do |i|
            joined.each do |el|
                newar[i] << el[i]
            end
        end
        newar
    end

    def my_rotate(n = 1)
        if n > 0
            n.times do 
                first = self.push(self.first)
                self.shift
            end
        else 
            n.abs.times do 
                last = self.pop()
                self.unshift(last)
            end
        end
        self
    end

    def join(sep = '')
        str = ''
        i = 0
        while i < self.length
            if i != self.length
                str += self[i] + sep
            elsif i == self.length - 1
                str += self[i]
            end
            i += 1
        end 
        str
    end
end

