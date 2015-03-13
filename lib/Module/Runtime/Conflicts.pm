use strict;
use warnings;
package Module::Runtime::Conflicts;
# ABSTRACT: Provide information on conflicts for Module::Runtime
# KEYWORDS: conflicts breaks modules prerequisites upgrade
# vim: set ts=8 sts=4 sw=4 tw=78 et :

package Module::Runtime::Conflicts;

use Module::Runtime ();
use Dist::CheckConflicts
    -dist      => 'Module::Runtime',
    -conflicts => {
        eval { Module::Runtime->VERSION('0.14'); 1 } ? ( 'Moose' => '2.1202' ) : (),
    },
    -also => [
        'Package::Stash::Conflicts',
        'Moose::Conflicts',
    ];

1;
__END__

=pod

=head1 SYNOPSIS

    `moose-outdated`

or

    use Module::Runtime::Conflicts;
    Module::Runtime::Conflicts->check_conflicts;

=head1 DESCRIPTION

This module provides conflicts checking for L<Module::Runtime>, which had a
recent release that broke some versions of L<Moose>. It is called from
L<Moose::Conflicts> and C<moose-outdated>.

=head1 SUPPORT

=for stopwords irc

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Module-Runtime-Conflicts>
(or L<bug-Module-Runtime-Conflicts@rt.cpan.org|mailto:bug-Module-Runtime-Conflicts@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 SEE ALSO

=for :list
* L<Dist::CheckConflicts>
* L<Moose::Conflicts>
* L<Dist::Zilla::Plugin::Breaks>
* L<Dist::Zilla::Plugin::Test::CheckBreaks>

=cut
