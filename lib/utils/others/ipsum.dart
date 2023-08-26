import 'dart:math';

const ipsumContent = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce maximus, elit sit amet vehicula vehicula, nisi sem congue eros, maximus euismod orci nibh non elit. Ut tellus purus, tristique ultrices accumsan ac, tempus a dui. Cras ultricies ex nec interdum tristique. Integer vel congue ante. Ut scelerisque lacus sit amet varius molestie. Etiam nec fermentum est, vel volutpat augue. Integer pellentesque a urna eget laoreet.

Sed pellentesque felis nec dignissim molestie. Ut aliquet turpis leo, at iaculis lectus consectetur placerat. Integer at nulla purus. Morbi tincidunt vehicula sapien ac lacinia. Suspendisse potenti. Praesent eu vulputate nisi. Nullam dictum at justo sed volutpat. Mauris auctor purus velit, vitae malesuada leo tempor sit amet. Proin eu placerat nulla. Nunc elit metus, fermentum sed dapibus in, finibus sed libero.

Sed et euismod velit, ut hendrerit orci. Ut blandit sollicitudin sapien eu dignissim. Vestibulum metus lectus, malesuada in dolor quis, lobortis vulputate quam. Vivamus eget orci leo. Phasellus bibendum ac ipsum eu auctor. Morbi eu mi sed orci tincidunt consequat. Vestibulum et dolor sapien. Sed ornare dui non felis dapibus, nec luctus lacus mollis. Aenean vitae velit ac leo malesuada pretium ac ut leo. Phasellus condimentum commodo sem et venenatis. Curabitur nisi mauris, tincidunt ac lacus dictum, sagittis fermentum augue. Phasellus sit amet scelerisque sapien. Vestibulum id dolor bibendum, pharetra lorem ac, tincidunt leo. Aliquam vitae luctus diam, quis volutpat diam.

Nam ut elit venenatis, eleifend mauris at, dignissim velit. Etiam venenatis faucibus eros, vitae imperdiet sem elementum vitae. Donec feugiat risus diam, condimentum dictum nibh pretium a. Nulla interdum ex vel tellus porttitor, ut vestibulum enim consectetur. Mauris hendrerit est a condimentum venenatis. Duis diam ex, ornare faucibus mauris quis, maximus viverra dolor. In hac habitasse platea dictumst. Pellentesque lacinia, ipsum a commodo ultrices, velit mauris suscipit arcu, eget finibus felis lacus eu sapien. Mauris eu nunc at ex elementum mattis a vitae metus.

Curabitur quis laoreet justo. Pellentesque ut enim arcu. Nam venenatis libero urna, at feugiat leo commodo ac. Nunc non tincidunt justo, vel feugiat ex. Ut convallis sit amet libero eget gravida. Sed iaculis elementum enim, ut tincidunt quam molestie ac. Aliquam erat volutpat. Praesent non consectetur metus. Sed viverra, quam nec porttitor efficitur, tortor mi pellentesque dolor, a ultrices nisi est eu dui.''';

class Ipsum{

  const Ipsum._();

  static String generate(int length){
    return ipsumContent.substring(0,min(length, ipsumContent.length));
  }
}