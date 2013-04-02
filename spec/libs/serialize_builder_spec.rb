# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SerializeBuilder do

  describe '#build!' do
    subject { SerializeBuilder.build!(file_content) }

    let(:file_content) { "name,age,category\n名前,12,a\nbye,10,b\n" }

    it { should eq 'a:2:{s:1:"a";a:1:{i:0;a:3:{s:4:"name";s:6:"名前";s:3:"age";i:12;s:8:"category";s:1:"a";}}s:1:"b";a:1:{i:0;a:3:{s:4:"name";s:3:"bye";s:3:"age";i:10;s:8:"category";s:1:"b";}}}'}
  end

end
