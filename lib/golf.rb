class Golf

  class << self

    def hole1(x)
      x.inject { |a,b| a * b }
    end
    
    def hole2(s)
      s.split(' ').sort_by { |x| x[1] }.join ' '
    end

    def hole3(x)
      x > 1 ? hole3(x-1) * x : 1
    end
    
    def hole4(x)
      x.collect { |s|
        s.gsub(/man\(([^\)]*)\)/, 'hat(man(\1))').
          gsub(/dog\(([^\)]*)\)/, 'dog(\1(bone))').
          gsub(/cat\(([^\)]*)\)/, 'dead(\1)')
      }
    end
    
    def hole5(l)
      (0 ... l.size).collect { |a| (a ... l.size).collect { |b| l[a .. b] } }.
        flatten(1).sort_by { |x| [x.size, x] }
    end
    
    def hole6(n)
      (1 .. n).collect { |x|
        if x % 15 == 0
          'fizzbuzz'
        elsif x % 3 == 0
          'fizz'
        elsif x % 5 == 0
          'buzz'
        else
          x
        end
      }
    end
    
    def hole8(n)
      l=[1,1]
      l = l + [l[-1]+l[-2]] while l.size < n
      l
    end
    
    def hole9(f)
      def h(v)
        c = v.flatten.uniq
        r = c.collect { |x| v.find_all { |y| y[0] == x }.size }
        if r.max > v.size / 2 or c.size < 3
          c[r.index(r.max)]
        else
          h v.collect { |x| x.select { |y| y != c[r.index(r.min)] } }
        end
      end
      h File.read(f).split("\n").collect { |s| s.split ', ' }
    end
 
    
  end

end
