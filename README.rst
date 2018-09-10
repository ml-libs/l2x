l2x
===

Contributing
------------

To setup development environment, fist of all just clone repository::

    $ git clone git@github.com:ml-libs/l2x.git

Create virtualenv with python3.6. For example
using *virtualenvwrapper* commands could look like::

   $ cd l2x
   $ mkvirtualenv --python=`which python3.6` l2x


After that please install libraries required for development::

    $ pip install -r requirements-dev.txt
    $ pip install -e .

Paper
-----
*Learning to Explain: An Information-Theoretic Perspective on Model Interpretation*
Jianbo Chen, Le Song, Martin J. Wainwright, Michael I. Jordan
https://arxiv.org/abs/1802.07814


Requirements
------------

* Python_ 3.6+

.. _Python: https://www.python.org
