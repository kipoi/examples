from kipoi.model import BaseModel


class GCBiasModel(BaseModel):

    def __init__(self, dummy=3):
        self.dummy = dummy

    def predict_on_batch(self, x):
        # TODO
        pass
