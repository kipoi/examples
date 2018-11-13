from kipoi.model import BaseModel


class GCBiasModel(BaseModel):

    def __init__(self, dummy=3):
        self.dummy = dummy

    def predict_on_batch(self, x):
        """
        Args:
          x (string): DNA sequence. Example 'ACGACATGAC'
        
        Returns:
          float: fraction of 'G' or 'C' bases in the sequence
        """
        # TODO
        pass