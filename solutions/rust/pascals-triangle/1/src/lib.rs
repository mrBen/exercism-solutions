pub struct PascalsTriangle;

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        let triangle = Vec::new();

        for i in 0..row_count {
            let row = Vec::new();
            triangle.push(row);
        }

        triangle
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        unimplemented!();
    }
}