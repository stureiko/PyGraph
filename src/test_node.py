import unittest


from src.node import Node


class TestNode(unittest.TestCase):

    # setUp method is overridden from the parent class TestCase
    def setUp(self):
        self.noneNode = Node()

    def test_noneNode(self):
        self.assertEqual(self.noneNode.name, 'none')
# //TODO: Добавить тестирование функционала узла


if __name__ == '__main__':
    unittest.main()
