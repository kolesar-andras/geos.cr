require "spec"
require "../src/geos.cr"

describe Geos do
  describe "wkt" do
    it "reads and writes wkt" do
      context = Geos::Lib.geos_init_r
      reader = Geos::Lib.geoswkt_reader_create_r(context)
      geometry = Geos::Lib.geoswkt_reader_read_r(context, reader, "POINT(1 1.5)");
      writer = Geos::Lib.geoswkt_writer_create_r(context);
      wkt = Geos::Lib.geoswkt_writer_write_r(context, writer, geometry)
      Geos::Lib.geoswkt_writer_destroy_r(context, writer);
      Geos::Lib.geoswkt_reader_destroy_r(context, reader);
      Geos::Lib.geos_finish_r(context);
      content = String.new(wkt)
      content.should eq "POINT (1.0000000000000000 1.5000000000000000)"
    end
  end
end
