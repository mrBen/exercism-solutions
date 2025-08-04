pub struct PascalsTriangle {
    row_count: u32
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        return PascalsTriangle { row_count: row_count };
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        let mut triangle = Vec::new();

        if self.row_count > 0 {
            triangle.push(vec![1]);  // first row (if there is one)
        }
        for i in 1..self.row_count as usize {
            let mut row = vec![1];

            for j in 1..i as usize {
                let ref prev_row: Vec<u32> = triangle[i-1];
                row.push(prev_row[j-1] + prev_row[j]);
            }
            row.push(1);

            triangle.push(row);
        }

        triangle
    }
}