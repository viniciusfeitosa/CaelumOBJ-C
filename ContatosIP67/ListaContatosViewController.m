//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

- (id)init{
    self = [super self];
    self.linhaDestaque = -1;
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

-(void) exibeFormulario{
    /*UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Exibir formulário" message:@"Isso é um UIAlertView" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];*/
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    form.contatos = self.contatos;
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void) viewWillAppear:(BOOL)animated  {
    NSLog(@"Total cadastro: %d", [self.contatos count]);
    [self.tableView reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatos count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contato *contato = self.contatos[indexPath.row];
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]initWithContato:contato];
    form.contatos = self.contatos;
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
}

-(void)contatoAtualizado:(Contato *)contato{
    self.linhaDestaque = [self.contatos indexOfObject:contato];
}

-(void)contatoAdicionado:(Contato *)contato{
    self.linhaDestaque = [self.contatos indexOfObject:contato];
}

-(void)viewDidAppear:(BOOL)animated{
    if (self.linhaDestaque >= 0){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaDestaque inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        self.linhaDestaque = -1;
    }
}

@end
