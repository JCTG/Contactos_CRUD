require 'test_helper'

class LibretumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   #El campo nombre debe ir lleno
  test "<<<<<<name is a requiered field >>>>>>>>>>>>>>>>" do
   libretum = Libretum.new
   libretum.nombre.nil? 
   assert :true
  end

   #El campo nombre debe ir lleno
  test "<<<<<<telefono is a requiered field >>>>>>>>>>>>>>>>" do
   libretum = Libretum.new
   libretum.tlf.nil? 
   assert :true
  end
end
