import unittest

from company.utilites import dummy_function


class TestDummyFunction(unittest.TestCase):

    def test_01(self):
        input = "hi"
        expected_output = "hi!"

        result = dummy_function(input)

        self.assertEqual(result, expected_output)
