use strict;
use warnings;
package Module::Runtime::Conflicts;
# ABSTRACT: Provide information on conflicts for Module::Runtime
# KEYWORDS: conflicts breaks modules prerequisites upgrade
# vim: set ts=8 sts=4 sw=4 tw=115 et :

our $VERSION = '0.003';

use Module::Runtime ();
use Dist::CheckConflicts
    -dist      => 'Module::Runtime',
    -conflicts => {
        # listed modules are the highest *non-working* version when used in
        # combination with the indicated version of Module::Runtime

        eval { Module::Runtime->VERSION('0.014'); 1 } ? (
            'Moose' => '2.1202',
            'MooseX::NonMoose' => '0.24',
            'Elasticsearch' => '1.00',
        ) : (),
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

=head1 SEE ALSO

=for :list
* L<Dist::CheckConflicts>
* L<Moose::Conflicts>
* L<Dist::Zilla::Plugin::Breaks>
* L<Dist::Zilla::Plugin::Test::CheckBreaks>

=cut
